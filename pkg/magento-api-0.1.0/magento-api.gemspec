# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{magento-api}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Matheson"]
  s.date = %q{2009-08-12}
  s.description = %q{Rubygem for connecting to a Magento store via the Magento Core API}
  s.email = %q{me@timmatheson.com}
  s.extra_rdoc_files = ["lib/abstract.rb", "lib/category.rb", "lib/configuration.rb", "lib/country.rb", "lib/customer.rb", "lib/customer_address.rb", "lib/customer_groups.rb", "lib/extensions.rb", "lib/inventory.rb", "lib/invoice.rb", "lib/magento.rb", "lib/order.rb", "lib/product.rb", "lib/product_images.rb", "lib/product_types.rb", "lib/region.rb", "lib/server.rb", "lib/shipment.rb", "README.rdoc"]
  s.files = ["config/magento.yml", "init.rb", "lib/abstract.rb", "lib/category.rb", "lib/configuration.rb", "lib/country.rb", "lib/customer.rb", "lib/customer_address.rb", "lib/customer_groups.rb", "lib/extensions.rb", "lib/inventory.rb", "lib/invoice.rb", "lib/magento.rb", "lib/order.rb", "lib/product.rb", "lib/product_images.rb", "lib/product_types.rb", "lib/region.rb", "lib/server.rb", "lib/shipment.rb", "Rakefile", "README.rdoc", "test/test_customer.rb", "test/test_helper.rb", "test/test_inventory.rb", "test/test_magento.rb", "test/test_order.rb", "Manifest", "magento-api.gemspec"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Magento-api", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{magento-api}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Rubygem for connecting to a Magento store via the Magento Core API}
  s.test_files = ["test/test_customer.rb", "test/test_helper.rb", "test/test_inventory.rb", "test/test_magento.rb", "test/test_order.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
