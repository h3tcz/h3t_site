# frozen_string_literal: true

module TransliteratePaperclip
  def transliterate_file_name(paperclip_file)
    paperclip_file = [paperclip_file] unless paperclip_file.is_a?(Enumerable)
    paperclip_file.each do |file|
      filename = read_attribute("#{file}_file_name")
      next if filename.blank?
      extension = File.extname(filename).gsub(/^\.+/, '')
      filename = filename.gsub(/\.#{extension}$/, '')
      send(file)
        .instance_write(:file_name, "#{filename.parameterize}.#{extension.parameterize}")
    end
  end
end

ActiveRecord::Base.send(:include, TransliteratePaperclip)
