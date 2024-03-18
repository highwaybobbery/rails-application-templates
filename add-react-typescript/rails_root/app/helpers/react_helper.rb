module ReactHelper
  def react_component(component, props = {})
    component = 'Datatable'
    content_tag(
      :div,
      '',
      data: { 
        behavior: 'react',
        component: component,
        props: props
      }
    )
  end
end
