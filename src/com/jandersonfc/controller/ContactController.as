package com.jandersonfc.controller
{
	import com.jandersonfc.event.ContactEvent;
	import com.jandersonfc.model.delegate.IContactDelegate;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
		
	public class ContactController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source="serviceHelper")]
		public var serviceHelper:ServiceHelper;
		
		[Inject(source="contactDelegate")]
		public var contactDelegate:IContactDelegate;
		
		[EventHandler(event="ContactEvent.GET_CONTACTS")]
		public function getContacts():void{			
			serviceHelper.executeServiceCall(contactDelegate.getContacts(),onGetContacts,onError);
		}
		
		[EventHandler(event="ContactEvent.SAVE_CONTACT")]
		public function save(event:ContactEvent):void{
			serviceHelper.executeServiceCall(contactDelegate.save(event.contact),onSave,onError);
		}
		
		[EventHandler(event="ContactEvent.REMOVE_CONTACT")]
		public function remove(event:ContactEvent):void{
			serviceHelper.executeServiceCall(contactDelegate.remove(event.contact),onRemove,onError);
		}
		
		public function onGetContacts(event:ResultEvent):void{
			if (event.result != null){
				var contactEvent:ContactEvent = new ContactEvent(ContactEvent.RETURN_CONTACTS);
				contactEvent.contacts = event.result as ArrayCollection;
				dispatcher.dispatchEvent(contactEvent);
			}
		}
		
		public function onSave(event:ResultEvent):void{
			var contactEvent:ContactEvent = new ContactEvent(ContactEvent.SAVED_CONTACT);
			dispatcher.dispatchEvent(contactEvent);
		}
		
		public function onRemove(event:ResultEvent):void{
			var contactEvent:ContactEvent = new ContactEvent(ContactEvent.REMOVED_CONTACT);
			dispatcher.dispatchEvent(contactEvent);
		}
		
		public function onError(event:FaultEvent):void{
			Alert.show(event.fault.message,"ERRO");
		}
		
	}
}