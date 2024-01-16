# frozen_string_literal: true
class ImageInput < CustomFileInput
  def input_fields
    form_out = []
    form_out << @builder
      .simple_fields_for(:"#{attribute_name.to_s}", wrapper: "bootstrap") do |form|
      inner_fields_for(form)
    end
    safe_join(form_out)
  end

  def inner_fields_for(form)
    out = []
    out << content_tag(:div, class: "sort_wrapper",
                             id: "#{attribute_name}_#{form.object.id}") do
      content_tag(:div, class: "well well-large") do
        inner_form(form)
      end
    end
    out << content_tag(:div, nil, class: "clearfix")
    safe_join(out)
  end

  def inner_form(form)
    sub_out = []
    sub_out << link_to_remove_file(form)
    sub_out << content_tag(:div,
                           class: "row #{form.object.new_record? ? "" : "hidden"}") do
      content_tag(:div, class: "col-md-2") do
        form.input(:image, as: :file)
      end
    end
    sub_out << uploaded_preview(form)
    sub_out << content_tag(:div, nil, class: "clearfix")
    safe_join(sub_out)
  end

  def preview_line(form)
    input_out = []
    input_out << content_tag(:div, class: "row") do
      content_tag(:div, class: "gallery") do
        link_to(rails_blob_path(form.object.image, only_path: true), class: "fancybox", only_path: true) do
          image_tag(rails_blob_path(form.object.image, only_path: true), alt: form.object.image, size: "100x100")
        end
      end
    end
    safe_join(input_out)
  end
end
