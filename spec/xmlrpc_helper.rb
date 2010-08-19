require 'xmlrpc/client'
# this module assumes you're in a Spec
module XmlrpcHelper

  # Invokes an XML-RPC webservice. Note that because we require options as
  # the first parameter, you must always enclose your parameters in brackets,
  # or else Ruby will lose it's marbles (there's a freakin' surprise).
  def invoke(action, options, method, *args)
    options ||= {}
    raise "Options must be hash" unless options.kind_of?(Hash)

    server = XMLRPC::Client.new2("http://someurl.somewhere.info:9999/some_path")
    # stubbing of "do_rpc" doesn't work, because processing just mystically
    # stops - no errors, no results, just ... stops. Gotta love Ruby
#    server.stub!(:do_rpc).and_return do |xml, async|
#      request.env['content_type'] = 'text/xml'
#      request.env['RAW_POST_DATA'] = xml
#
#      post action, options
#
#      return response.body
#    end

    # Just a redeclaration of "create" for the sole purpose of exposing it
    def server.create
      super
    end

    # Just a redeclaration of "parser" for the sole purpose of exposing it
    def server.parser
      super
    end

    # stubbing of call2 - we do this instead of redefining it (as we did with
    # parser and create) because we need access to "request", "post" and
    # "response", which doesn't carry over in a redeclaration.
    server.stub!(:call2).and_return do |method, *args|
      xml = server.create().methodCall(method, *args)
      # the following 2 instructions cannot be placed directly into the
      # following "post" instruction - they don't carry over to the request
      # e.g. post 'rpc', {:partner_id => partner.id}, {:content_type => 'application/xml', 'RAW_POST_DATA' => xml}
      # Ee use "text/xml" purely because that's what Ruby's XML-RPC returns.
      # We could have used "application/xml", but for the sake of consistency
      # we use the older mime
      request.env['content_type'] = 'text/xml'
      request.env['RAW_POST_DATA'] = xml

      post action, options
      data = response.body
      server.parser().parseMethodResponse(data)
    end
    
    return server.call(method, *args)
  end

end