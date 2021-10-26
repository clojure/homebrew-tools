class ClojureAT1101681 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.681.tar.gz"
  sha256 "9c7d4e0166b02740e3cdaf10ba80b25ef230bf4e3a2e20e21cceb1521ddb7b3d"
  license "EPL-1.0"

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
