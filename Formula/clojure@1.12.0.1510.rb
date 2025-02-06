class ClojureAT11201510 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1510/clojure-tools-1.12.0.1510.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1510.tar.gz"
  sha256 "2379c585f42447167c37d7e8b9346e7f886323d914bcc22295c81d61051a09c3"
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
