module SecuredGenStr
  private
  def secured_gen_str(attr)
    str = ""
    loop do
      str_len = Settings.public_send(self.class.name.underscore.pluralize)
                        .public_send(attr)
                        .public_send(:secure_length).to_i / 2
      str = SecureRandom.hex(str_len)
      break unless self.class.exists?(attr => str)
    end
    assign_attributes(attr => str)
    str
  end
end