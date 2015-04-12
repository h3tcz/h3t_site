module TransliteratePaperclip
   def transliterate_file_name(paperclip_file)
    paperclip_file=[paperclip_file] unless paperclip_file.is_a?(Enumerable)
    paperclip_file.each do |file|
      filename=read_attribute("#{file}_file_name")
      if filename.present?
        extension = File.extname(filename).gsub(/^\.+/, '')
        filename = filename.gsub(/\.#{extension}$/, '')
        self.send(file).instance_write(:file_name, "#{filename.parameterize}.#{extension.parameterize}")
      end
    end
  end
end

ActiveRecord::Base.send(:include, TransliteratePaperclip)
