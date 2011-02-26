package com.jandersonfc.model.delegate.impl
{
	import com.jandersonfc.model.delegate.IContactDelegate;
	import com.jandersonfc.model.entity.Contact;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ContactDelegate implements IContactDelegate
	{
		
		[Inject(source="contactService")]
		public var contactService:RemoteObject;				
		
		public function getContacts():AsyncToken {
			return contactService.getContacts();
		}
		
		public function save(contact:Contact):AsyncToken {			
			return contactService.save(contact);
		}
		
		public function remove(contact:Contact):AsyncToken{
			return contactService.remove(contact);
		}		
	}
}