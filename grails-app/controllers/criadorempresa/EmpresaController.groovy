package criadorempresa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional(readOnly = true)
class EmpresaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	def index(Integer max) {
		params.max = 20

		if (params.queryCnpj) {
			def empresaList = Empresa.createCriteria().list (params) {
				if ( params.queryCnpj ) {
					ilike("cnpj", "%${params.queryCnpj}%")
				}
			}

			[empresaInstanceList: empresaList, empresaInstanceCount: empresaList.totalCount]
		} else 	if (params.queryRazaoSocial) {
			def empresaList = Empresa.createCriteria().list (params) {
				if ( params.queryRazaoSocial ) {
					ilike("razaoSocial", "%${params.queryRazaoSocial}%")
				}
			}

			[empresaInstanceList: empresaList, empresaInstanceCount: empresaList.totalCount]
		} 	else if (params.queryMunicipio) {
			def empresaList = Empresa.createCriteria().list (params) {
				if ( params.queryMunicipio ) {
					ilike("municipio", "%${params.queryMunicipio}%")
				}
			}

			[empresaInstanceList: empresaList, empresaInstanceCount: empresaList.totalCount]
		} 	else if (params.queryUf) {
			def empresaList = Empresa.createCriteria().list (params) {
				if ( params.queryUf ) {
					ilike("uf", "%${params.queryUf}%")
				}
			}

			[empresaInstanceList: empresaList, empresaInstanceCount: empresaList.totalCount]
		}else {
			respond Empresa.list(params), model:[empresaInstanceCount: Empresa.count()]
		}
	}

	def show(Empresa empresaInstance) {
		respond empresaInstance
	}

	def create() {
		def empresa =  new Empresa()
		empresa.isMatriz = true
		respond empresa
	}

	@Transactional
	def save(Empresa empresaInstance) {
		if (empresaInstance == null) {
			notFound()
			return
		}

		if (empresaInstance.hasErrors()) {
			respond empresaInstance.errors, view:'create'
			return
		}

		def uploadedFile = request.getFile('filePayload')
		if (uploadedFile != null && uploadedFile.size > 0) {
			if ('application/vnd.openxmlformats-officedocument.wordprocessingml.document' == uploadedFile.contentType ||
			'application/msword' == uploadedFile.contentType || 'application/rtf' == uploadedFile.contentType  || 'application/pdf' == uploadedFile.contentType) {
				empresaInstance.filePayload = uploadedFile.getBytes()
			}
			else {
				flash.message = 'tipo de arquivo do contrato social incorreto'

				render view:'create', model:['empresaInstance':empresaInstance]
				return
			}
		}

		def logotipo = request.getFile('logotipo')
		if (logotipo != null && logotipo.size > 0) {
			if ('image/png' == logotipo.contentType || 'image/gif' == logotipo.contentType || 'image/jpeg' == logotipo.contentType ) {
				empresaInstance.logotipo = logotipo.getBytes()
			} else {
				flash.message = 'tipo de arquivo do logotipo incorreto'

				render view:'create', model:['empresaInstance':empresaInstance]
				return
			}
		}

		empresaInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'empresa.label', default: 'Empresa'),
					empresaInstance.id
				])
				redirect empresaInstance
			}
			'*' {
				respond empresaInstance, [status: CREATED]
			}
		}
	}

	def logotipo= {
		def empresa = Empresa.get( params.id )
		byte[] image = empresa.logotipo
		response.outputStream << image
	}

	def docEmpresa= {
		def empresa = Empresa.get( params.id )
		byte[] doc = empresa.filePayload
		response.outputStream << doc
	}

	def edit(Empresa empresaInstance) {
		flash.editing = true
		respond empresaInstance
	}

	@Transactional
	def update(Empresa empresaInstance) {
		if (empresaInstance == null) {
			notFound()
			return
		}

		if (empresaInstance.hasErrors()) {
			respond empresaInstance.errors, view:'edit'
			return
		}

		def uploadedFile = request.getFile('filePayload')
		if (uploadedFile != null && uploadedFile.size > 0) {
			if ('application/vnd.openxmlformats-officedocument.wordprocessingml.document' == uploadedFile.contentType ||
			'application/msword' == uploadedFile.contentType || 'application/rtf' == uploadedFile.contentType  || 'application/pdf' == uploadedFile.contentType) {
				empresaInstance.filePayload = uploadedFile.getBytes()
			}
			else {
				flash.message = 'tipo de arquivo do contrato social incorreto'

				render view:'create', model:['empresaInstance':empresaInstance]
				return
			}
		}

		def logotipo = request.getFile('logotipo')
		if (logotipo != null && logotipo.size > 0) {
			if ('image/png' == logotipo.contentType || 'image/gif' == logotipo.contentType || 'image/jpeg' == logotipo.contentType ) {
				empresaInstance.logotipo = logotipo.getBytes()
			} else {
				flash.message = 'tipo de arquivo do logotipo incorreto'

				render view:'create', model:['empresaInstance':empresaInstance]
				return
			}
		}


		empresaInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Empresa.label', default: 'Empresa'),
					empresaInstance.id
				])
				redirect empresaInstance
			}
			'*'{
				respond empresaInstance, [status: OK]
			}
		}
	}

	@Transactional
	def delete(Empresa empresaInstance) {

		if (empresaInstance == null) {
			notFound()
			return
		}

		empresaInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Empresa.label', default: 'Empresa'),
					empresaInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'empresa.label', default: 'Empresa'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
