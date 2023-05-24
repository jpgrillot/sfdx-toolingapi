public class toolingapi_DependencyAPIController {
	//Retrieve All Objects in org
    @Auraenabled(cacheable=true)
    public static ObjectDetail getObjects()
    {
        List<toolingapi_FieldInfo.Record> objects=getCustomObject();
        List<toolingapi_FieldInfo.Record> fields=getObjectFields();
        ObjectDetail detail=new ObjectDetail();
        detail.Objects=objects;
        detail.Fields=fields;
        return detail;
    }
    
    @Auraenabled(cacheable=true)
    public static List<ApexClass> getApex()
    {
       return [Select Id,Name from ApexClass];
    }
    
    @Auraenabled(cacheable=true)
    public static List<AuraDefinitionBundle> getLightningComponent()
    {
        return [Select Id,DeveloperName  from AuraDefinitionBundle];
    }
    
    public static List<toolingapi_FieldInfo.Record> getCustomObject()
    {
        string sql='SELECT Id,DeveloperName from CustomObject';
        String result = toolingAPISOQL(sql);
        if(string.isNotBlank(result))
        {
          	toolingapi_FieldInfo data=toolingapi_FieldInfo.parse(result);
          	return data.records;
        }
        return null;
    }
    
    @Auraenabled(cacheable=true)
    public static List<toolingapi_FieldInfo.Record> getObjectFields()
    {
        string sql='SELECT Id,DeveloperName,TableEnumOrId from CustomField';
        String result = toolingAPISOQL(sql);
        if(string.isNotBlank(result))
        {
          	toolingapi_FieldInfo data=toolingapi_FieldInfo.parse(result);
          	return data.records;
        }
        return null;
    }
    
    static String toolingAPISOQL(string query) {
        String baseURL='callout:ToolingRest?';
        return toolingapi_HttpCallout.restGet( baseURL +'q='+ (query.replace(' ', '+')),'GET', UserInfo.getSessionId());
    } 
    @AuraEnabled(cacheable=true)
    public static List<toolingapi_DependentInfo.Record> getDepdency(string id) {
        string sql='Select MetadataComponentId, MetadataComponentName, RefMetadataComponentName, RefMetadataComponentId,MetadataComponentType from MetadataComponentDependency where RefMetadataComponentId=\'id\'';
        String result = toolingAPISOQL(sql.replace('id', id));
        if(string.isNotBlank(result))
        {
          	toolingapi_DependentInfo data= toolingapi_DependentInfo.parse(result);
          	return data.records;
        }
        return null;
    }
    
    public class ObjectDetail {
		@AuraEnabled
		public List<toolingapi_FieldInfo.Record> Objects {get;set;} 
        @AuraEnabled
       	public List<toolingapi_FieldInfo.Record> Fields {get;set;} 
    } 
}