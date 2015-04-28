class ImageInput < CustomFileInput

  def input_fields
    @builder.simple_fields_for(:"#{attribute_name.to_s}", wrapper: "bootstrap") do |form|
      "<div class='well well-large'>".html_safe+ \
        link_to_remove_file(form)+\
        "#{form.object.new_record? ? '' : '<div class=\'hidden\'>' }".html_safe+\
        "<div class='row'>".html_safe+\
          "<div class='col-md-2'>".html_safe+form.input(:image, as: :file)+"</div>".html_safe+\
        "</div>".html_safe+ \
        "#{form.object.new_record? ? '' : '</div>' }".html_safe+\
        uploaded_preview(form)+ \
        "<div class='clearfix'></div>".html_safe+\
      "</div>".html_safe+ \
      "<div class='clearfix'></div>".html_safe
    end.html_safe
  end

  def preview_line(form)
    "<div class='row'>
      <div class='gallery'>".html_safe+ \
      link_to(form.object.image.url, class: 'fancybox') do
        image_tag(form.object.image.url(:thumb), alt: form.object.image.try(:alt))
      end.html_safe + \
      "</div>
    </div>".html_safe
  end
end
