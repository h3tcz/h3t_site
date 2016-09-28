class ImageInput < CustomFileInput
  def input_fields
    form_out = []
    form_out << @builder
      .simple_fields_for(:"#{attribute_name.to_s}", wrapper: 'bootstrap') do |form|
      out = []
      out << content_tag(:div, class: 'well well-large') do
        inner_form(form)
      end
      out << content_tag(:div, nil, class: 'clearfix')
      safe_join(out)
    end
    safe_join(form_out)
  end

  def inner_form(form)
    sub_out = []
    sub_out << link_to_remove_file(form)
    sub_out << content_tag(:div,
                           class: "row #{form.object.new_record? ? '' : 'hidden'}") do
      content_tag(:div, nil, class: 'col-md-2') do
        form.input(:image, as: :file)
      end
    end
    sub_out << uploaded_preview(form)
    sub_out << content_tag(:div, nil, class: 'clearfix')
    safe_join(sub_out)
  end

  def preview_line(form)
    input_out = []
    input_out << content_tag(:div, class: 'row') do
      content_tag(:div, class: 'gallery') do
        link_to(form.object.image.url, class: 'fancybox') do
          image_tag(form.object.image.url(:thumb), alt: form.object.image.try(:alt))
        end
      end
    end
    safe_join(input_out)
  end
end
