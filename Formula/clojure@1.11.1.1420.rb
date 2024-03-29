class ClojureAT11111420 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1420/clojure-tools-1.11.1.1420.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1420.tar.gz"
  sha256 "afd113e9bc4df16ae233c05433cc936d9b1e649977ec84b05f6af0ade633eb51"
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
