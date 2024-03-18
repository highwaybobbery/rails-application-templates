require 'rails/generators'

class ReactComponentGenerator < Rails::Generators::Base
  argument :component_name

  def create_component_file
    create_file "app/javascript/components/#{component_name.underscore}.jsx", <<~RUBY
      import React, {useState} from 'react'

      const #{component_name.camelize} = props => {
        const [] = useState(props.#{component_name.underscore})

        return (
          <div className='#{component_name.dasherize}'>
            <em>#{component_name.camelize}</em>
          </div>
        )
      }

      export default #{component_name.camelize}
    RUBY
  end

  def pin_component
    insert_into_file('config/importmap.rb', "pin 'components/#{component_name.underscore}.jsx', to: 'components/#{component_name.underscore}.js'")
  end
end
