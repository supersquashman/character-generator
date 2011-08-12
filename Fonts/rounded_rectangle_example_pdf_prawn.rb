# encoding: utf-8
#
# Rounded rectangle example demonstrating both stroke and stroke and fill.
# A rectangle with rounded join_style is added just for comparison.
#
#require File.expand_path(File.join(File.dirname(__FILE__),
 #                                  %w[.. example_helper]))
 require 'prawn'
 require 'rqrcode'

pdf = Prawn::Document.new

pdf.font "pterra.ttf"
pdf.font_size 8
pdf.draw_text "a stroked rounded rectangle:", :at => [30, 575]
pdf.stroke_rounded_rectangle([50, 550], 50, 100, 10)
pdf.draw_text "a stroked and filled rounded rectangle:", :at => [180, 575]
pdf.fill_and_stroke_rounded_rectangle([200, 550], 50, 100, 10)
pdf.draw_text "a regular rectangle with rounded join style;", :at => [330, 575]
pdf.draw_text "needs thick line width for similar result:", :at => [330, 565]
pdf.join_style :round
pdf.line_width 10
pdf.stroke_rectangle([350, 550], 50, 100)

pdf.font "GameIcons.ttf"
pdf.font_size 20
pdf.draw_text "D", :at => [55, 500]

pdf.font "Futura Bold BT.ttf"
pdf.font_size 10
pdf.line_width 1
pdf.join_style :miter
pdf.fill_rectangle([0,pdf.bounds.top - 10], 200, 10)
pdf.fill_color "ffffff"
pdf.draw_text "TEST DATA 1", :at => [5, pdf.bounds.top - 18]


xoff = 204
yoff = pdf.bounds.top - 10
del = 2
qr = RQRCode::QRCode.new('html://www.fairchildsemi.com')
qr.modules.each_index { |i| qr.modules.each_index { |j| 
pdf.fill_color "000000" if qr.dark?(i,j) 
pdf.fill_color "ffffff" if !qr.dark?(i,j)
pdf.fill_rectangle([xoff + del*j, yoff - del*i], del, del)
}}


pdf.render_file "rounded_rectangle.pdf"