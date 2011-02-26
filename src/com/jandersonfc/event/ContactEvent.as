package com.jandersonfc.event
{
	import com.jandersonfc.model.entity.Contact;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ContactEvent extends Event
	{
		
		public static const GET_CONTACTS:String="getContacts";
		public static const SAVE_CONTACT:String="saveContact";
		public static const REMOVE_CONTACT:String="removeContact";
		
		public static const RETURN_CONTACTS:String="showContacts";
		public static const SAVED_CONTACT:String="savedContact";
		public static const REMOVED_CONTACT:String="removedContact";
		
		public var contact:Contact;
		public var contacts:ArrayCollection;
		
		public function ContactEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}