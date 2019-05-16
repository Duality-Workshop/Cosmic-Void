/// @description Adds a row to the bottom of the grid and returns the index of the new row
/// @param GridID
var _grid = argument0;
var _h=ds_grid_height(_grid);
ds_grid_resize(_grid,ds_grid_width(_grid),_h+1);
return(_h);
