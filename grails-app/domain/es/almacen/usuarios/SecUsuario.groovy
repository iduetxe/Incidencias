package es.almacen.usuarios

class SecUsuario {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Rol> getAuthorities() {
		SecUsuarioRol.findAllBySecUsuario(this).collect { it.rol } as Set
	}
}
