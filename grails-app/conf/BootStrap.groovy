import es.almacen.usuarios.*
import es.almacen.servicios.*
import es.almacen.incidencias.*
import es.almacen.incidencias.material.*

class BootStrap {

	def springSecurityService

	def init = { servletContext ->
/*#########################  ROLES    ###############################3*/
		def userRole = Rol.findByAuthority('ROLE_USER') ?: new Rol(authority: 'ROLE_USER').save(failOnError: true)
		def tecRole = Rol.findByAuthority('ROLE_TECNICO') ?: new Rol(authority: 'ROLE_TECNICO').save(failOnError: true)
		def adminRole = Rol.findByAuthority('ROLE_ADMIN') ?: new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)


/*######################### USUARIOS  ###############################3*/
		def adminUser = Usuario.findByUsername('admin') ?: new Usuario(
			name: 'Administrador Campeon',
			username: 'admin',
			password: springSecurityService.encodePassword('admin'),
			enabled: true).save(failOnError: true)
		if (!adminUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create adminUser, adminRole
		}

		def tecUser = Usuario.findByUsername('tecnico') ?: new Usuario(
			name: 'Tecnico currante',
			username: 'tecnico',
			password: springSecurityService.encodePassword('tecnico'),
			enabled: true).save(failOnError: true)
		if (!tecUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create tecUser, tecRole
		}

		def userUser = Usuario.findByUsername('user') ?: new Usuario(
			name: 'Juana de los Arcos',
			username: 'Juana',
			password: springSecurityService.encodePassword('user'),
			enabled: true).save(failOnError: true)
		if (!userUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create userUser, userRole
		}
/*######################### SERVICIOS ###############################3*/

		def servEnfermeria	= Servicio.findByNombre('Enfermeria') ?: new Servicio(nombre:'Enfermeria', responsable:userUser).save(failOnError: true)
		def servCalefaccion = Servicio.findByNombre('Calefacción') ?: new Servicio(nombre:'Calefacción', responsable:userUser).save(failOnError: true)
		def servJardineria	= Servicio.findByNombre('Jardinería') ?: new Servicio(nombre:'Jardinería', responsable:userUser).save(failOnError: true)


/*#########################   ETIQUETAS  ############################3*/
        Etiqueta ropa = new Etiqueta(nombre:'Ropa').save(failOnError:true);
        Etiqueta herramienta = new Etiqueta(nombre:'Herramienta').save(failOnError:true);

/*#########################   MATERIAL   ############################3*/
		def llave 	= Material.findByNombre('Llave inglesa') ?:	    new Material(nombre: "Llave inglesa", referencia:'lli',	 cantidad:4)
                llave.addToEtiquetas(herramienta)
                llave.save(failOnError:true)
		def sabanas 	= Material.findByNombre('Sábanas') ?:		new Material(nombre: "Sábanas",		  referencia:'sab',  cantidad:10)
                sabanas.addToEtiquetas(ropa)
                sabanas.save(failOnError:true)
		def bombilla 	= Material.findByNombre('Bombilla') ?: 		new Material(nombre: "Bombilla",	  referencia:'bom',  cantidad:100)
                bombilla.save(failOnError:true)
/*######################### INCIDENCIAS #############################3*/
		for (i in 0..130 ) {
			def inci = new Incidencia(
						estadoIncidencia:'ABIERTA',
						servicio:servEnfermeria,
						prioridad: i % 5 +1,
						titulo:"Incidencia con un texto descriptivo y relevante" + i,
						responable:tecUser,
						nombreContacto:"Contacto de inci " + i
						)
			inci.save(failOnError:true)
			
			/*#########################   NOTAS  ################################3*/
			for (j in 0..5 ) {
				def nota = new Nota(
						incidencia: inci,
						owner: userUser,
						texto: "Incidencia larga 0 con un texto enorme para ver que pasa en la mierda del cuaderno verde que no está muy bien hecho. Esperemos que si, porque es un poco coñazo hacerlo bien: Incidencia larga "
						)
				nota.save(failOnError:true)
			}

			/*#########################   NOTAS  ################################3*/
			def matLlave = new MaterialUtilizado(incidencia: inci,material: llave,cantidad: 1).save(failOnError:true)
			def matSabana = new MaterialUtilizado(incidencia: inci,material: sabanas,cantidad: 1).save(failOnError:true)


		}


        //TipoMaterial tp = new TipoMaterial(etiqueta:ropa, material: sabanas).save(failOnError:true);
        //TipoMaterial tp2 = new TipoMaterial(etiqueta:herramienta, material: llave).save(failOnError:true);
        //TipoMaterial tp3 = new TipoMaterial(etiqueta:herramienta, material: bombilla).save(failOnError:true);

	}

    def destroy = {
    }
}
