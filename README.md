# splitappendix
A simple shellscript for splitting the PDF of a paper into the main body and an appendix.

This isn't exactly rocket science, but it's something I have to do frequently enough when submitting academic papers that I figured it's worth semi-automating. Hopefully you find it saves you a few minutes each time too!

## Installation

Simply clone the repo, move/rename the script to your somewhere on your `$PATH`, and make it executable. For example:

```bash
git clone git@github.com:egrefen/splitappendix.git
cd splitappendix
chmod +x splitappendix.sh
echo ln -s `pwd`/splitappendix.sh ~/.local/bin/splitapp
```

## Usage

```bash
splitapp path_to_paper.pdf first_page_of_appendix
```

This assumes you've named the script `splitapp` and put it in your path.
Once run, the files `submission.pdf` and `appendix.pdf` will be put in the same directory as the target paper.

## License

This project is released under the MIT License. See [LICENSE](./LICENSE) for details.