package de.libutzki.xtext.semanticmodeloutline.ui.actions

import com.google.inject.Inject
import de.libutzki.xtext.semanticmodeloutline.ui.content.UriNode
import org.eclipse.jface.action.Action
import org.eclipse.xtext.ui.IImageHelper.IImageDescriptorHelper
import org.eclipse.xtext.ui.editor.outline.IOutlineNode
import org.eclipse.xtext.ui.editor.outline.actions.AbstractFilterOutlineContribution
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode

/**
 * @author Oliver Libutzki <oliver@libutzki.de>
 *
 */
class FilterDerivedElementsOutlineContribution extends AbstractFilterOutlineContribution {
	
	public static final String PREFERENCE_KEY = "ui.outline.filterDerivedElements";
	
	@Inject
	IImageDescriptorHelper imageHelper
	
	override protected apply(IOutlineNode outlineNode) {
		val parent = outlineNode.parent
		!(parent instanceof DocumentRootNode) || parent.children.indexOf(outlineNode) == 0

	}
	
	
	override protected configureAction(Action action) {
		action.setText("Hide derived elements");
		action.setDescription("Hide derived elements");
		action.setToolTipText("Hide derived elements");
		//action.setImageDescriptor(imageHelper.getImageDescriptor("filterUri.gif"));
	}
	
	override getPreferenceKey() {
		PREFERENCE_KEY
	}
	
}