# frozen_string_literal: true
module ApplicationHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    bootstrap_html_message(sentence, messages)
  end

  def bootstrap_html_message(sentence, messages)
    html = []
    html << <<-HTML
    <div class="alert alert-danger alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h5>#{sentence}</h4>
      #{messages}
    </div>
    HTML

    safe_join(html)
  end

  def menu_link_to(name, link, controller = nil, action = nil)
    content_tag(:li, class: (equal_to_params(controller, action) ? 'active' : '')) do
      link_to(name, link)
    end
  end

  # TODO: solve static pages ids
  def equal_to_params(controller, action)
    controller == params[:controller] &&
      action.include?(params[:action]) if controller && action
  end
end
