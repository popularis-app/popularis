# Popularis

Popularis es un buscador de sentencias de tribunales panameños para hacerlas fácilmente accesibles a todos a través de una página web, con el objetivo de compartir conocimiento de derecho en Panamá y fomentar la rendición de cuentas de los jueces.

## Para empezar

Estas instrucciones buscan que puedas correr el programa en tu propia computadora localmente para development y testing. Para deployment, encontrarás información más adelante.

### Prerequisitos

Antes de empezar, asegurate tener esto instalado en tu computadora:

```
ruby 2.4.3
rails 5.2
postgres
```

### Instalación

(1) Fork/clone este repository para poder ver el código en tu computadora
(2) En la terminal:

```
bundle
rails db:migrate db:seed
rails s
```

(3) Con eso, deberías poder ver el sitio en <code>http://localhost:3000</code> en el navegador.

<!--
## Running the tests

Explain how to run the automated tests for this system -->

<!-- ### Break down into end to end tests

Explain what these tests test and why

```
Give an example
``` -->

<!-- ### And coding style tests

Explain what these tests test and why

```
Give an example
``` -->

## Deployment

El servidor del sitio en producción está en Heroku actualmente bajo el sitio <code>http://popularis.herokuapp.com</code>

De tener algún inconveniente con el sitio en producción, empiece por correr <code>heroku logs</code> en el Terminal.



## Stack

* [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) - MVC Ruby framework
* [Simple Form](https://github.com/plataformatec/simple_form) - Gem para agilizar creación de formularios
* [Cloudinary](https://cloudinary.com/) - Archivador de  media assets
* [Dotenv](https://github.com/bkeepers/dotenv) - Gem para guardar en secreto los env variables
* [FontAwesome](https://fontawesome.com/) - Símbolos en la plataforma

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds


## Programadora

* **Juliette Chevalier** - [juliettech](https://github.com/juliet-tech)

[Contribuidores](https://github.com/your/project/contributors)

