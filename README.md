Stamp It
========

StampIt allows you to add watermarks to existing PDF files. In a very easy way. This gem will be very helpful whenever you need to add a dynamic watermark to any PDF file. Internally, it uses the [Prawn gem](https://github.com/prawnpdf/prawn) to generate the watermark template file. And then it uses the [pdftk binary](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) to add the watermark template file as a background to an existing PDF file. So, you need to have the **pdftk** binary installed on your application's server.

## Installation

1. Add the following line to your Rails application's Gemfile:

  ````ruby
    gem 'stamp-it', require: 'stamp_it'
  ````
  
1. Optionally, you can add the following gem to have access to the **pdftk** binaries.

  ````ruby
    gem 'pdftk-binary'
  ````

## Usage

1. First you will need to create the watermark template file:

  ````ruby
    wm_template_path = StampIt::Watermark.create('/path/to/wm_template.pdf', 'Message to add as a Watermark.')
  ````

2. Add the watermark template as background to an existing PDF file:

  ````ruby
    StampIt::Background.add('/path/to/existing.pdf', wm_template_path, '/path/to/watermarked.pdf')
  ````

3. That's it, you will generate a watermarked file.

## Contributing

Pull Requests are welcome! Just fork the repo, add your code and open a PR.
