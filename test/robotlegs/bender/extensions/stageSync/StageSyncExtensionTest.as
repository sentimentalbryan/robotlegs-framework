//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.stageSync
{
	import flash.display.DisplayObjectContainer;
	import org.flexunit.assertThat;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.object.isTrue;
	import robotlegs.bender.framework.context.api.IContext;
	import robotlegs.bender.framework.context.impl.Context;
	import spark.components.Group;

	public class StageSyncExtensionTest
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var context:IContext;

		private var contextView:DisplayObjectContainer;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before(ui)]
		public function before():void
		{
			context = new Context();
			contextView = new Group();
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test]
		public function adding_contextView_to_stage_initializes_context():void
		{
			context.require(
				StageSyncExtension,
				contextView);
			UIImpersonator.addElement(contextView);
			assertThat(context.initialized, isTrue());
		}

		[Test]
		public function adding_contextView_that_is_already_on_stage_initializes_context():void
		{
			UIImpersonator.addElement(contextView);
			context.require(
				StageSyncExtension,
				contextView);
			assertThat(context.initialized, isTrue());
		}

		[Test]
		public function removing_contextView_from_stage_destroys_context():void
		{
			context.require(
				StageSyncExtension,
				contextView);
			UIImpersonator.addElement(contextView);
			UIImpersonator.removeElement(contextView);
			assertThat(context.destroyed, isTrue());
		}
	}
}
