# Popularis

Popularis es un buscador de sentencias de tribunales panameños para hacerlas fácilmente accesibles a todos a través de una página web, con el objetivo de compartir conocimiento de derecho en Panamá y fomentar la rendición de cuentas de los jueces.

## Para empezar

Estas instrucciones buscan que puedas correr el programa en tu propia computadora localmente para development y como deploy la aplicación al production environment.

### Prerequisitos

Antes de empezar, debes tener esto instalado en tu computadora:

```
ruby 2.4.3
rails 5.2
postgresql 10.4
```

### Instalación

(1) Fork/clone este repository para poder ver el código localmente en tu computadora <br>

(2) En la terminal:

```
bundle
rails db:migrate db:seed
```

(3) Asegurarse de tener las `environment variables` (por ej, API keys) escritas en su código local adentro de `popularis/.env`.

(4) Para crear el servidor local, corra `rails server` en el Terminal y deberías poder ver el sitio en `http://localhost:3000` en el navegador.

## Buscador

Esta sección busca explicar lo que sucede cada vez que alguien accede al buscador y llega a `sentences#index`:

(1) Si el usuario no escribió nada, verá todas las sentencias en el orden como estan guardadas en la base de datos.

(2) Si el usuario escribió una palabra(`@query`), la plataforma buscara una palabra similar a esa adentro de:

 * Nombre de cada sentencia
 * Tipo de cada sentencia
 * Institución de cada sentencia
 * Entrada de cada sentencia
 * Contenido del Cuerpo
 * Tipo de Cuerpo

  Luego se crea un nuevo hash: `{sentencia: cantidad}` -> donde `sentencia` es el objeto en cuestión y la `cantidad` es el número de veces que aparece `@query` en las columnas establecidas en el punto 2 de cada sentencia.

  Luego estas se ordenan de manera que las que tienen el número más alto van al inicio.

(3) Si `@query` no existe en ningun lado, podrá ver un texto para que se trate de nuevo.

## Para manipular la base de datos

* En el Terminal:

```
$ rails console

  Sentence.all
  Feedback.all
  Sentence.first.bodies.all
  ..cualquier método de [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html)
```

* En el navegador:

  De no escribir nada en la barra del buscador, podrá ver todas las *sentencias* en http://localhost:3000/sentences en development o http://popularis.herokuapp.com/sentences en production.

  Para ver todos los *feedbacks* recibidos puede acceder a http://localhost:3000/feedbacks en development o http://popularis.herokuapp.com/feedbacks en production.

## Deployment

El servidor en producción está en Heroku actualmente bajo el sitio `http://popularis.herokuapp.com` <br>

De tener algún inconveniente en producción, empiece por correr `heroku logs` en el Terminal y la documentación de [Heroku](https://devcenter.heroku.com/).

## Para el futuro

El próximo paso seguro será conseguir un _SSL certificate_ para poder tener seguro el sitio de cualquier hacker (https). Esto se puede lograr por medio de Heroku con tal de que se este pagando al menos por el Plan Hobby. También lo ofrece GoDaddy.

He dejado instalado [Devise](https://github.com/plataformatec/devise) para cuando estén listos para crear `usuarios` en la plataforma.

En ese sentido, falta agregar tambien el Admin interface para poder visualizar la data y agregar [Pundit](https://github.com/varvet/pundit) para trabajar el authorization de los usuarios mientras navegan en la plataforma.

## .env variables

Para el manejo de las environment variables, se ha utilizado [Dotenv Gem](https://github.com/bkeepers/dotenv)

* En development:

En `popularis/.env` podrá encontrar todas las `environment variables` para cualquier modificación. Este file solo existe localmente y quien quiera trabajar la plataforma deberá tener las correctas en su file local.

* En producción:

Una vez publique el sitio online, deberá escribir en el Terminal `heroku config:set API_KEY=value`(reemplazando `API_KEY` por el nombre del API y `value` por el key secreto correspondiente) para enviar las variables al servidor.

Las `environment variables` que existen actualmente en producción se pueden encontrar dentro del `Heroku Dashboard > Settings > Config Vars > Reveal Config Vars`

## Stack

* [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) - MVC Ruby framework
* [Dotenv](https://github.com/bkeepers/dotenv) - Gem para guardar en secreto los env variables
* [Cloudinary](https://cloudinary.com/) - Archivador de  media assets
* [Fullstory](https://www.fullstory.com/) - Tracking
* [Simple Form](https://github.com/plataformatec/simple_form) - Gem para agilizar creación de formularios
* [FontAwesome](https://fontawesome.com/) - Símbolos en la plataforma

## Programadora

* **Juliette Chevalier** - [juliettech](https://github.com/juliet-tech)

[Contribuidores](https://github.com/your/project/contributors)

## Para agregar nuevas sentencias acceda a [Popularis API](https://github.com/juliet-tech/popularis-api)
