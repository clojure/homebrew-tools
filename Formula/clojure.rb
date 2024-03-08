class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.2.1441/clojure-tools-1.11.2.1441.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.2.1441.tar.gz"
  sha256 "ba88acc4a2be27cd108ad0bafd47e68f18f41d0ab63f557aeb1166a6ca9b75b7"
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
