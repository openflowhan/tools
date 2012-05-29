#!/usr/bin/ruby

require "benchmark"
require "openssl"

max_count = 72000

key = "abcdefghij" * 25 + "123456"

sha256 = OpenSSL::Digest::SHA256.new

Benchmark.bm(10) do |bench|
bench.report("HAMC256: "){
	(0...max_count).each do |i|
#		data = "%01000d" % i
		data = "%05d" % i
		digest = OpenSSL::HMAC::hexdigest(sha256, key, data)
#		printf "digest %d is %s\n", i, digest 
#		printf "digest %d \n", i
	end
}
end
