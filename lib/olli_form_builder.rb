class OlliFormBuilder < ActionView::Helpers::FormBuilder
  helpers = field_helpers +
            %w{date_select datetime_select time_select} +
            %w{collection_select select country_select time_zone_select} -
            %w{hidden_field label fields_for}

  helpers.each do |name|
    define_method(name) do |field, *args|
      options = args.last.is_a?(Hash) ? args.pop : {}
      label = label(field, options[:label])
      if name == 'check_box' or name == 'radio'
        content = super + ' ' + label
      else
        content = @template.content_tag(:span, label, :class => 'form-label') + @template.content_tag(:span, super, :class => 'form-field')
      end
      @template.content_tag(:li, content, :class => 'form-field-' + field.to_s.dasherize)
    end
  end
  
  def submit label
    @template.content_tag(:button, label, :type => 'submit')
  end
end