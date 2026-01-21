const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#08090C", /* black   */
  [1] = "#797065", /* red     */
  [2] = "#85796A", /* green   */
  [3] = "#7F827D", /* yellow  */
  [4] = "#958876", /* blue    */
  [5] = "#AFA392", /* magenta */
  [6] = "#C5BAA8", /* cyan    */
  [7] = "#dfdad2", /* white   */

  /* 8 bright colors */
  [8]  = "#9c9893",  /* black   */
  [9]  = "#797065",  /* red     */
  [10] = "#85796A", /* green   */
  [11] = "#7F827D", /* yellow  */
  [12] = "#958876", /* blue    */
  [13] = "#AFA392", /* magenta */
  [14] = "#C5BAA8", /* cyan    */
  [15] = "#dfdad2", /* white   */

  /* special colors */
  [256] = "#08090C", /* background */
  [257] = "#dfdad2", /* foreground */
  [258] = "#dfdad2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
