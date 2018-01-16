applicationContext-ccss-common-dubbo-provider.xml:

	<dubbo:service ref="${table.tableNameJavaFL}Facade" interface="${basePack}.api.facade.${modulePack}.${table.tableNameJavaFU}Facade" />
	<bean id="${table.tableNameJavaFL}Facade" class="${basePack}.core.facade.impl.${modulePack}.${table.tableNameJavaFU}FacadeImpl" />	
			
applicationContext-ccss-facade.xml

	<dubbo:reference id="${table.tableNameJavaFL}Facade" interface="${basePack}.api.facade.${modulePack}.${table.tableNameJavaFU}Facade" />