#' Reset graphical parameters to default
#'
#' @description
#' Resets graphical parameters to default values without closing the graphics device.
#'
#'
#' @export

reset.par = function(){
  defaultPar = list(
    xlog = FALSE,
    ylog = FALSE,
    adj = 0.5,
    ann = TRUE,
    ask = FALSE,
    bg = "white",
    bty = "o",
    cex = 1,
    cex.axis = 1,
    cex.lab = 1,
    cex.main = 1.2,
    cex.sub = 1,
    cin = c(0.15, 0.20),
    col = "black",
    col.axis = "black",
    col.lab = "black",
    col.main = "black",
    col.sub = "black",
    cra = c(19.8, 26.4),
    crt = 0,
    csi = 0.2,
    cxy = c(0.03238893, 0.23758099),
    din = c(5.871212, 2.681818),
    err = 0,
    family = "",
    fg = "black",
    fig = c(0, 1, 0, 1),
    fin = c(5.871212, 2.681818),
    font = 1,
    font.axis = 1,
    font.lab = 1,
    font.main = 2,
    font.sub = 1,
    lab = c(5, 5, 7),
    las = 0,
    lend = "round",
    lheight = 1,
    ljoin = "round",
    lmitre = 10,
    lty = "solid",
    lwd = 1,
    mai = c(1.02, 0.82, 0.82, 0.42),
    mar = c(5.1, 4.1, 4.1, 2.1),
    mex = 1,
    mfcol = c(1, 1),
    mfg = c(1, 1, 1, 1),
    mfrow = c(1, 1),
    mgp = c(3, 1, 0),
    mkh = 0.001,
    new = FALSE,
    oma = c(0, 0, 0, 0),
    omd = c(0, 1, 0, 1),
    omi = c(0, 0, 0, 0),
    page = TRUE,
    pch = 1,
    pin = c(4.6312121, 0.8418182),
    plt = c(0.1396645, 0.9284645, 0.3803390, 0.6942373),
    ps = 12,
    pty = "m",
    smo = 1,
    srt = 0,
    tck = NA,
    tcl = -0.5,
    usr = c(0, 1, 0, 1),
    xaxp = c(0, 1, 5),
    xaxs = "r",
    xaxt = "s",
    xpd = FALSE,
    yaxp = c(0, 1, 5),
    yaxs = "r",
    yaxt = "s",
    ylbias = 0.2
  )

  suppressWarnings(par(defaultPar))
}
