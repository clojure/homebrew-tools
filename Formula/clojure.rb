class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  mirror "https://github.com/clojure/brew-install/releases/download/1.11.1.1369/clojure-tools-1.11.1.1369.tar.gz"
  url "https://download.clojure.org/install/clojure-tools-1.11.1.1369.tar.gz"
  sha256 "e4187f7c4091fcb95c6b42a23e852dc95736c7b91a4835388c80995cc138676e"
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
