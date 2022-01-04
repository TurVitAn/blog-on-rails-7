require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

require('trix')
require('@rails/actiontext')

import 'controllers'
import '../stylesheets/aplication.scss';

document.addEventListener('turbolinks:load', () => {
    document.addEventListener('click', () => {
        let element = event.target.closest('.paragraph-content')
        if (!element) return;

        element.classList.add('d-none')
        element.nextElementSibling.classList.remove('d-none')
    })

    document.addEventListener('click', () => {
        if (!event.target.matches('.cancel')) return;

        let element = event.target.closest('.paragraph-form')

        element.classList.add('d-none')
        element.previousElementSibling.classList.remove('d-none')
    })
})
