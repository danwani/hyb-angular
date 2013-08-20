/*
 * [y] hybris Platform
 *
 * Copyright (c) 2000-2013 hybris AG
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of hybris
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with hybris.
 * 
 *  
 */
package se.berg.angularstore.fulfilmentprocess.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import se.berg.angularstore.fulfilmentprocess.constants.AngularstoreFulfilmentProcessConstants;

import org.apache.log4j.Logger;

@SuppressWarnings("PMD")
public class AngularstoreFulfilmentProcessManager extends GeneratedAngularstoreFulfilmentProcessManager
{
	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger( AngularstoreFulfilmentProcessManager.class.getName() );
	
	public static final AngularstoreFulfilmentProcessManager getInstance()
	{
		ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (AngularstoreFulfilmentProcessManager) em.getExtension(AngularstoreFulfilmentProcessConstants.EXTENSIONNAME);
	}
	
}
