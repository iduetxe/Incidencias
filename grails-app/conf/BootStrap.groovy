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


/*#########################   MATERIAL   ############################3*/
		def llave 	= Material.findByNombre('Llave inglesa') ?:	    new Material(nombre: "Llave inglesa", referencia:'lli',	 cantidad:4)
                llave.save(failOnError:true)
                llave.addTag("herramienta")
		def sabanas 	= Material.findByNombre('Sábanas') ?:		new Material(nombre: "Sábanas",		  referencia:'sab',  cantidad:10)
                sabanas.save(failOnError:true)
                sabanas.addTag("ropa de cama")
                sabanas.addTag("ropa")
		def bombilla 	= Material.findByNombre('Bombilla') ?: 		new Material(nombre: "Bombilla",	  referencia:'bom',  cantidad:100)
                bombilla.save(failOnError:true)
                bombilla.addTag("herramienta")
                bombilla.addTag("consumible")
        def chaqueta 	= Material.findByNombre('Chaqueta') ?:		new Material(nombre: "Chaqueta",      referencia:'chaq',  cantidad:2)
                chaqueta.save(failOnError:true)
                chaqueta.addTag("ropa de personal")
                chaqueta.addTag("ropa")
        def escobas 	= Material.findByNombre('Escobas') ?:		new Material(nombre: "Escobas",      referencia:'esb32',  cantidad:2)
                escobas.save(failOnError:true)
                escobas.addTag("limpieza")
                escobas.addTag("suelo")
        def jabon 	= Material.findByNombre('Jabón') ?:		new Material(nombre: "Jabón",      referencia:'jb25',  cantidad:100)
                jabon.save(failOnError:true)
                jabon.addTag("limpieza")
                jabon.addTag("baño")
        def lejia 	= Material.findByNombre('Lejía') ?:		new Material(nombre: "Lejía",      referencia:'lejia',  cantidad:2)
                lejia.save(failOnError:true)
                lejia.addTag("limpieza")
                lejia.addTag("baño")
        def tenedor 	= Material.findByNombre('Tenedor') ?:new Material(nombre: "Tenedor",      referencia:'Tnd',  cantidad:200)
                tenedor.save(failOnError:true)
                tenedor.addTag("comida")
                tenedor.addTag("utensilio")
        def cuchillo 	= Material.findByNombre('Cuchillo') ?:new Material(nombre: "Cuchillo",      referencia:'cortacorta',  cantidad:200)
                cuchillo.save(failOnError:true)
                cuchillo.addTag("comida")
                cuchillo.addTag("utensilio")
        def cuchara 	= Material.findByNombre('Cuchara') ?:new Material(nombre: "Cuchara",      referencia:'slurp',  cantidad:200)
                cuchara.save(failOnError:true)
                cuchara.addTag("comida")
                cuchara.addTag("utensilio")
        def papelCulo 	= Material.findByNombre('Papel del culo') ?:new Material(nombre: "Papel del culo",      referencia:'limpiaZurraspa',  cantidad:2)
                papelCulo.save(failOnError:true)
                papelCulo.addTag("baño")
        def pano 	= Material.findByNombre('Paño de limpieza') ?:new Material(nombre: "Paño de limpieza",      referencia:'paño',  cantidad:23)
                papelCulo.save(failOnError:true)
                papelCulo.addTag("baño")
                papelCulo.addTag("limpieza")



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
