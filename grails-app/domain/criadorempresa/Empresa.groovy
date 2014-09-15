package criadorempresa

class Empresa {

	static constraints = {
		razaoSocial(blank:false, maxSize:100, unique:true)
		cnpj(blank:false,cnpj:true,maxSize:18, unique:true)
		logradouro(blank:false, maxSize:150)
		numero(blank:false,min:0,validator: {
			return it > 0 &&  it.toString().size() <=10
		})
		complemento(maxSize:150, nullable:true)
		municipio(blank:false, maxSize:150)
		uf(blank:false, maxSize:2)
		telefone1(blank:false)
		telefone2(nullable:true)
		fax(nullable:true)
		email(email:true,nullable:true)
		isMatriz()		
		matriz(nullable:true)
		
		filePayload(blank: true , nullable:true, maxSize:10485760)
		logotipo(blank: true , nullable:true, maxSize:2097152)
	}

	static hasMany = [ filiais: Empresa ]
	static belongsTo = [ matriz: Empresa ]

	String razaoSocial
	String cnpj
	String logradouro
	Integer numero
	String complemento
	String municipio
	String uf
	Boolean isMatriz
	String telefone1
	String telefone2
	String fax
	String email
	
	byte[] filePayload
	byte[] logotipo
	
	String toString() {
		return razaoSocial
	}
}
