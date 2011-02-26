package com.jandersonfc.view
{
	import com.jandersonfc.event.ContactEvent;
	import com.jandersonfc.model.entity.Contact;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.CloseEvent;	
	
	public class ContactPM
	{
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
						
		[Bindable]
		public var contact:Contact;
		
		[Bindable]
		public var contacts:ArrayCollection;
				
		[Bindable]
		public var currentState:String="default";

		public function getContacts():void
		{
			var event:ContactEvent=new ContactEvent(ContactEvent.GET_CONTACTS);
			dispatcher.dispatchEvent(event);
		}

		public function insert():void
		{
			contact=new Contact();
			currentState="contactForm";
		}

		public function udpate(obj:Object):void
		{
			if (obj != null)
			{
				contact=obj as Contact;
				currentState="contactForm";
			}
		}

		public function save():void
		{
			var event:ContactEvent=new ContactEvent(ContactEvent.SAVE_CONTACT);
			event.contact=contact;
			dispatcher.dispatchEvent(event);

		}

		public function remove(obj:Object):void
		{
			if (obj != null)
				contact = obj as Contact; 
				Alert.show("Tem certeza que gostaria de excluir esse contato?", "Excluindo Contato", Alert.OK | Alert.CANCEL, null, onConfirmRemove);
		}

		private function onConfirmRemove(event:CloseEvent):void
		{
			if (event.detail == Alert.OK)
				confirmedRemove();			
		}

		public function confirmedRemove():void
		{
			var event:ContactEvent=new ContactEvent(ContactEvent.REMOVE_CONTACT);
			event.contact=contact;
			dispatcher.dispatchEvent(event);
		}

		public function cancel():void
		{
			getContacts();
		}
				
		[EventHandler(event="ContactEvent.RETURN_CONTACTS")]
		public function onGetContacts(event:ContactEvent):void
		{
			contacts=event.contacts;
			currentState="default";
		}		
		
		[EventHandler(event="ContactEvent.SAVED_CONTACT")]
		[EventHandler(event="ContactEvent.REMOVED_CONTACT")]
		public function onReturnOperation(event:ContactEvent):void
		{
			getContacts();
		}

	}
}