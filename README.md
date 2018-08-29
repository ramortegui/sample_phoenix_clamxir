# Sample
Sample is a phoenix application to show how to use
[Clamxir](https://github.com/ramortegui/clamxir) with phoenix.

# Requirements
Clamav installed

# Use
  * Clone the repository `git clone
    https://github.com/ramortegui/sample_phoenix_clamxir.git`
  * Go to the root of the application `cd sample_phoenix_clamxir`
  * Install dependencies `mix deps.get`
  * Start Phoenix endpoint `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser and upload files.

The application will only check if a file is safe and then is destroyed, please check `lib/sample_web/controller/page_controller.ex` to see how has been implemented.

For a file with a malware signature please refer to:
[http://www.eicar.org/86-0-Intended-use.html](http://www.eicar.org/86-0-Intended-use.html)
