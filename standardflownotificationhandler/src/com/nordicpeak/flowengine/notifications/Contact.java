package com.nordicpeak.flowengine.notifications;

import se.unlogic.standardutils.string.StringTag;

public class Contact {

	@StringTag
	private final String firstname;

	@StringTag
	private final String lastname;

	@StringTag
	private final String email;

	@StringTag
	private final String mobilePhone;

	public Contact(String firstname, String lastname, String email, String mobilePhone) {

		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.mobilePhone = mobilePhone;
	}

	public String getFirstname() {

		return firstname;
	}

	public String getLastname() {

		return lastname;
	}

	public String getEmail() {

		return email;
	}

	public String getMobilePhone() {

		return mobilePhone;
	}

}
