applicationContext-ccss-common-dubbo-provider.xml:

	<dubbo:service ref="${table.tableNameJavaFL}Facade" interface="${basePack}.${modulePack}.api.facade.${table.modelNameLow}.${table.tableNameJavaFU}Facade" />
	<bean id="${table.tableNameJavaFL}Facade" class="${basePack}.${modulePack}.core.facade.impl.${table.modelNameLow}.${table.tableNameJavaFU}FacadeImpl" />	
			
applicationContext-ccss-facade.xml

	<dubbo:reference id="${table.tableNameJavaFL}Facade" interface="${basePack}.${modulePack}.api.facade.${table.modelNameLow}.${table.tableNameJavaFU}Facade" />