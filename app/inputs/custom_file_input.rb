class CustomFileInput < SimpleForm::Inputs::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Context
  include ActionView::Helpers::AssetTagHelper

  def input(wrapper_options)
    image_html
  end

  def image_html
    ret = "<div class='#{attribute_name.to_s}-fields'>"
    if object.send(attribute_name.to_s)
      ret << input_fields
    end
    ret << "</div>"
    ret << link_to_add_file
    ret << "<div class='clearfix'></div>".html_safe
    ret
  end

  def link_to_add_file
    options[:multiple] ? @builder.link_to_add('', :"#{attribute_name.to_s}", :data => { :target => ".#{attribute_name.to_s}-fields" }, class: "glyphicon glyphicon-plus pull-right", title: I18n.t("#{attribute_name.to_s}.add")) : ''
  end

  def link_to_remove_file(form)
    options[:multiple] ? form.link_to_remove('', title: I18n.t("#{attribute_name.to_s}.destroy"), class: "glyphicon glyphicon-remove pull-right", data: { confirm: I18n.t(:are_you_sure) }) : ''
  end

  def uploaded_preview(form)
    uploaded = ''
    unless form.object && form.object.new_record?
      uploaded = preview_line(form)
    end
    uploaded
  end

  def preview_line
  end

  def input_fields
  end
end
