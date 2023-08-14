class ClojureAT11111379 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  mirror "https://github.com/clojure/brew-install/releases/download/1.11.1.1379/clojure-tools-1.11.1.1379.tar.gz"
  url "https://download.clojure.org/install/clojure-tools-1.11.1.1379.tar.gz"
  sha256 "63c325043221052343955f643a4f33a07b5e64ac77e1627663a0157d7fc1c8e4"
  license "EPL-1.0"

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -M -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -M -e \"(+ 1 1)\"").strip
    end
  end
end
