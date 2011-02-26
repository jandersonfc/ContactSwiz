package com.jandersonfc.model.entity
{
	[RemoteClass(alias="com.jandersonfc.business.entity.Contact")]
	[Bindable]
	public class Contact
	{
		
		public var id:Number;
		
		public var name:String;
		
		public var lastName:String;
		
		public var phone:String;		
		
		public var email:String;
		
		public var birthDate:Date;
		
	}
}