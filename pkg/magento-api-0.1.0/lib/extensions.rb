class Hash
   def to_struct(struct_name)
      Struct.new(struct_name,*keys).new(*values)
   end
   
   def stringify_keys!
     keys.each do |key|
       self[key.to_s] = delete(key)
     end
     self
   end
   
   def method_missing(method, *args)
     self["#{method}"]
   end
end