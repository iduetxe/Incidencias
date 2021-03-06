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

/*######################### SERVICIOS ###############################3*/

        def servEnfermeria	= Servicio.findByNombre('Enfermeria') ?:
            new Servicio(
                    nombre:'Enfermeria',
                    codigo:'P3P1-ENF',
                    tipoServicio:TipoServicio.NORMAL,
                    tlfContacto: 660010443,
                    pabellon:'Pab. III - San Francisco',
                    planta:1)
        def servEnfermeria2	= Servicio.findByNombre('Enfermeria') ?:
            new Servicio(
                    nombre:'Enfermeria',
                    codigo:'P3P2-ENF',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.NORMAL,
                    pabellon:'Pab. III - San Francisco',
                    planta:2)
        def servJardineria	= Servicio.findByNombre('Jardinería') ?:
            new Servicio(
                    nombre:'Jardinería',
                    codigo:'P2-JAR',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.TECNICO,
                    pabellon:'Pab. II - El moro',
                    planta:2)
        def servFachadas	= Servicio.findByNombre('Fachadas') ?:
            new Servicio(
                    nombre:'Fachadas',
                    codigo:'P1P0-Fachadas',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.NORMAL,
                    pabellon:'Pab. I - Quirugicos',
                    planta:0)
        def servCalefaccion = Servicio.findByNombre('Calefacción') ?:
            new Servicio(
                    nombre:'Calefacción',
                    codigo:'P3P2-CAL',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.NORMAL,
                    pabellon:'Pab. III - San Francisco',
                    planta:2)
        def servPower       = Servicio.findByNombre('Electricidad') ?:
            new Servicio(
                    nombre:'Electricidad',
                    codigo:'P1P1-ELE',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.TECNICO,
                    pabellon:'Pab. I - EL bolado del campanario',
                    planta:1)
        def servControl     = Servicio.findByNombre('Talleres') ?:
            new Servicio(
                    nombre:'Talleres',
                    codigo:'Talleres',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.GESTOR,
                    pabellon:'Pab. III - San Francisco',
                    planta:1)

       def servEcoCardio= Servicio.findByNombre('Ecocardiogramas') ?:
            new Servicio(
                    nombre:'Ecocardiogramas',
                    codigo:'PLP0-Eco',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.NORMAL,
                    pabellon:'Pab. San Luis',
                    planta:0)

       def servEndoscopias= Servicio.findByNombre('Endoscopias') ?:
            new Servicio(
                    nombre:'Endoscopias',
                    codigo:'PLP0-Endo',
                    tlfContacto: 660010443,
                    tipoServicio:TipoServicio.NORMAL,
                    pabellon:'Pab. San Luis',
                    planta:0)

       def servDespacho1= Servicio.findByNombre('Desp. Médico Anestesista') ?:
             new Servicio(
                     nombre:'Desp. Médico Anestesista',
                     codigo:'PQP1-DesMedAnes',
                     tlfContacto: 660010443,
                     tipoServicio:TipoServicio.NORMAL,
                     pabellon:'Pab. Quirúrgico',
                     planta:1)

       def servDespacho2= Servicio.findByNombre('Desp. Médico Trauma (1)') ?:
             new Servicio(
                     nombre:'Desp. Médico Trauma (1)',
                     codigo:'PQP1-DesMedTrauma1',
                     tlfContacto: 660010443,
                     tipoServicio:TipoServicio.NORMAL,
                     pabellon:'Pab. Quirúrgico',
                     planta:1)
       def servDespacho3= Servicio.findByNombre('Desp. Médico Trauma (2)') ?:
              new Servicio(
                      nombre:'Desp. Médico Trauma (2)',
                      codigo:'PQP1-DesMedTrauma2',
                      tlfContacto: 660010443,
                      tipoServicio:TipoServicio.NORMAL,
                      pabellon:'Pab. Quirúrgico',
                      planta:1)

       def servDespacho4= Servicio.findByNombre('Desp. Médico Medicina Interna (2)') ?:
              new Servicio(
                      nombre:'Desp. Médico Trauma (2)',
                      codigo:'PFP1-DespMedicinaInterna',
                      tlfContacto: 660010443,
                      tipoServicio:TipoServicio.NORMAL,
                      pabellon:'Pab. San Francisco',
                      planta:1)
       def servConsulta= Servicio.findByNombre('Consulta (1)') ?:
              new Servicio(
                      nombre:'Consulta (1)',
                      codigo:'PRP1-Consulta1',
                      tlfContacto: 660010443,
                      tipoServicio:TipoServicio.NORMAL,
                      pabellon:'Pab. San Ramon',
                      planta:1)


/*######################### USUARIOS  ###############################3*/
		def adminUser = Usuario.findByUsername('admin') ?: new Usuario(
			name: 'Administrador Campeon',
			username: 'admin',
			password: springSecurityService.encodePassword('admin'),
            servicio : servControl,
			enabled: true).save(failOnError: true)
		if (!adminUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create adminUser, adminRole
		}

		def tecUser = Usuario.findByUsername('jardinero') ?: new Usuario(
			name: 'El moreenoo',
			username: 'jardinero',
            servicio : servJardineria,
			password: springSecurityService.encodePassword('jardinero'),
			enabled: true).save(failOnError: true)
		if (!tecUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create tecUser, tecRole
		}

        def chispasUser = Usuario.findByUsername('Chispas') ?: new Usuario(
            name: 'Chispas de la luz',
            username: 'Chispas',
            servicio : servPower,
            password: springSecurityService.encodePassword('Chispas'),
            enabled: true).save(failOnError: true)
        if (!chispasUser.authorities.contains(adminRole)) {
            SecUsuarioRol.create chispasUser, tecRole
        }

		def userUser = Usuario.findByUsername('Juana') ?: new Usuario(
			name: 'Juana de los Arcos',
			username: 'Juana',
            servicio : servEnfermeria,
			password: springSecurityService.encodePassword('Juana'),
			enabled: true).save(failOnError: true)
		if (!userUser.authorities.contains(adminRole)) {
			SecUsuarioRol.create userUser, userRole
		}

        def fontaUser = Usuario.findByUsername('Manolo') ?: new Usuario(
            name: 'Manolo & perico',
            username: 'Manolo',
            servicio : servCalefaccion,
            password: springSecurityService.encodePassword('Manolo'),
            enabled: true).save(failOnError: true)
        if (!userUser.authorities.contains(adminRole)) {
            SecUsuarioRol.create fontaUser, userRole
        }


/*#########################  SALVAR SERVICIOS ###############################*/

        servEnfermeria.responsable=userUser
        servEnfermeria.save(failOnError: true)

        servEnfermeria2.responsable=userUser
        servEnfermeria2.save(failOnError: true)

        servPower.responsable=chispasUser
        servPower.save(failOnError: true)

        servFachadas.responsable=fontaUser
        servFachadas.save(failOnError: true)

        servControl.responsable= adminUser
        servControl.save(failOnError: true)

        servJardineria.responsable=tecUser
        servJardineria.save(failOnError: true)

        servCalefaccion.responsable=fontaUser
        servCalefaccion.save(failOnError: true)



        servEcoCardio.responsable=userUser
        servEcoCardio.save(failOnError: true)

        servEndoscopias.responsable=userUser
        servEndoscopias.save(failOnError: true)

        servDespacho1.responsable=userUser
        servDespacho1.save(failOnError: true)

        servDespacho2.responsable=userUser
        servDespacho2.save(failOnError: true)

        servDespacho3.responsable=userUser
        servDespacho3.save(failOnError: true)

        servDespacho4.responsable=userUser
        servDespacho4.save(failOnError: true)

        servConsulta.responsable=userUser
        servConsulta.save(failOnError: true)




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
            Servicio s;
            if (i % 2 == 0){s = servEnfermeria}
            else {s=servCalefaccion}
			def inci = new Incidencia(
						estadoIncidencia:EstadoIncidencia.ABIERTA,
						servicio:s,
						prioridad: i % 5 +1,
						titulo:"Incidencia con un texto descriptivo y relevante" + i,
						servicioTecnico:servControl,
						contacto:userUser
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
			def matLlave = new MaterialUtilizado(incidencia: inci,material: llave,usuario:tecUser,cantidad: 1).save(failOnError:true)
			def matSabana = new MaterialUtilizado(incidencia: inci,material: sabanas,usuario:tecUser,cantidad: 1).save(failOnError:true)


		}
	}

    def destroy = {
    }
}
