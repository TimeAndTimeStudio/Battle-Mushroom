package crc64158d7576b92bf39c;


public class Main
	extends crc64493ac3851fab1842.AndroidGameActivity
	implements
		mono.android.IGCUserPeer
{

	public Main ()
	{
		super ();
		if (getClass () == Main.class) {
			mono.android.TypeManager.Activate ("BattleMushroom.Main, BattleMushroom", "", this, new java.lang.Object[] {  });
		}
	}

	public void onCreate (android.os.Bundle p0)
	{
		n_onCreate (p0);
	}

	private native void n_onCreate (android.os.Bundle p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
