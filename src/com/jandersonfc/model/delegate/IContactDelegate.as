package com.jandersonfc.model.delegate
{
	import com.jandersonfc.model.entity.Contact;
	
	import mx.rpc.AsyncToken;

	public interface IContactDelegate
	{
		
		function getContacts():AsyncToken;
		function save(contact:Contact):AsyncToken;
		function remove(contact:Contact):AsyncToken;
		
	}
}