class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1386/clojure-tools-1.11.1.1386.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1386.tar.gz"
  sha256 "7b944b9ecc9d099291bfa3ffc82f05c4ae4080ad068fa609c3b138d6778662c3"
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
