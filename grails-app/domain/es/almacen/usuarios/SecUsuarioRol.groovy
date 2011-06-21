package es.almacen.usuarios

import org.apache.commons.lang.builder.HashCodeBuilder

class SecUsuarioRol implements Serializable {

	SecUsuario secUsuario
	Rol rol

	boolean equals(other) {
		if (!(other instanceof SecUsuarioRol)) {
			return false
		}

		other.secUsuario?.id == secUsuario?.id &&
			other.rol?.id == rol?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (secUsuario) builder.append(secUsuario.id)
		if (rol) builder.append(rol.id)
		builder.toHashCode()
	}

	static SecUsuarioRol get(long secUsuarioId, long rolId) {
		find 'from SecUsuarioRol where secUsuario.id=:secUsuarioId and rol.id=:rolId',
			[secUsuarioId: secUsuarioId, rolId: rolId]
	}

	static SecUsuarioRol create(SecUsuario secUsuario, Rol rol, boolean flush = false) {
		new SecUsuarioRol(secUsuario: secUsuario, rol: rol).save(flush: flush, insert: true)
	}

	static boolean remove(SecUsuario secUsuario, Rol rol, boolean flush = false) {
		SecUsuarioRol instance = SecUsuarioRol.findBySecUsuarioAndRol(secUsuario, rol)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(SecUsuario secUsuario) {
		executeUpdate 'DELETE FROM SecUsuarioRol WHERE secUsuario=:secUsuario', [secUsuario: secUsuario]
	}

	static void removeAll(Rol rol) {
		executeUpdate 'DELETE FROM SecUsuarioRol WHERE rol=:rol', [rol: rol]
	}

	static mapping = {
		id composite: ['rol', 'secUsuario']
		version false
	}
}
