package java.awt

import java.awt.image.ColorModel
import java.awt.image.Raster
class ColorPaintContext(color: Int, cm: ColorModel) with PaintContext  { 

	{
			this???=color
	}

	var color: Int = 0
	var savedTile: WritableRaster = null
	def getRaster(x: Int, y: Int, w: Int, h: Int): Raster = {
		var t: WritableRaster = savedTile
		if (t == null || w > t.getWidth() || h > t.getHeight()) {							
				t=getColorModel()
				var icr: IntegerComponentRaster = 
				Arrays.fill(icr.getDataStorage(),color)
				icr.markDirty()
				if (w <= 64 && h <= 64) {											
						savedTile=t
				}
		}
		t
	}
}


