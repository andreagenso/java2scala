package java.awt;

import java.awt.image.ColorModel;
import java.awt.image.Raster;

class ColorPaintContext implements PaintContext {
    int color;
    WritableRaster savedTile;

    protected ColorPaintContext(int color, ColorModel cm) {
        this.color = color;
    }

    public synchronized Raster getRaster(int x, int y, int w, int h) {
        WritableRaster t = savedTile;

        if (t == null || w > t.getWidth() || h > t.getHeight()) {
            t = getColorModel().createCompatibleWritableRaster(w, h);
            IntegerComponentRaster icr = (IntegerComponentRaster) t;
            Arrays.fill(icr.getDataStorage(), color);
            icr.markDirty();
            if (w <= 64 && h <= 64) {
                savedTile = t;
            }
        }

        return t;
    }
}
