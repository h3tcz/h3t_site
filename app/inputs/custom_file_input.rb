class CustomFileInput < SimpleForm::Inputs::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Context
  include ActionView::Helpers::AssetTagHelper

  def input(_wrapper_options)
    image_html
  end

  def image_html
    ret = []
    ret << content_tag(:div, class: "#{attribute_name}-fields") do
      input_fields if object.send(attribute_name.to_s)
    end
    ret << content_tag(:div, class: 'well well-large add-sign') do
      link_to_add_file
    end
    ret << content_tag(:div, nil, class: 'clearfix')
    safe_join(ret)
  end

  def link_to_add_file
    if options[:multiple]
      @builder.link_to_add('',
                           :"#{attribute_name.to_s}",
                           data: { target: ".#{attribute_name}-fields" },
                           class: 'glyphicon glyphicon-plus pull-right',
                           t°8itle: I18n.t("#{attribute_name}.add"))
    else
      ''
    end
  end

  def link_to_remove_file(form)
    if options[:multiple]
      form.link_to_remove('',
                          title: I18n.t("#{attribute_name}.destroy"),
                          class: 'glyphicon glyphicon-remove pull-right',
                          data: { confirm: I18n.t(:are_you_sure) })
    else
      ''
    end
  end

  def uploaded_preview(form)
    uploaded = ''
    uploaded = preview_line(form) unless form.object && form.object.new_record?
    uploaded
  end

  def preview_line
  end

  def input_fields
  end
end
